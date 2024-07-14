% Prompt user to select a video file
[file, path] = uigetfile({'*.mp4', 'MP4 Files'; '*.avi', 'AVI Files'}, 'Select the video file');
if isequal(file, 0)
    error('User selected Cancel');
else
    videoPath = fullfile(path, file);
    disp(['User selected: ', videoPath]);
end

% Check if the file exists
if ~isfile(videoPath)
    error('The specified video file does not exist: %s', videoPath);
end

% Extract frames from the video
outputFolder = 'output_frames';
if ~exist(outputFolder, 'dir')
    mkdir(outputFolder);
end

disp('Starting frame extraction...');
videoReader = VideoReader(videoPath);
frameCount = 0;

while hasFrame(videoReader)
    frame = readFrame(videoReader);
    frameFileName = fullfile(outputFolder, sprintf('frame_%05d.jpg', frameCount));
    imwrite(frame, frameFileName);
    frameCount = frameCount + 1;
end

disp('Frame extraction completed.');

% Preprocess images
inputFolder = 'output_frames';
outputFolder = 'preprocessed_frames';
if ~exist(outputFolder, 'dir')
    mkdir(outputFolder);
end

disp('Starting image preprocessing...');
imageFiles = dir(fullfile(inputFolder, '*.jpg'));
for k = 1:length(imageFiles)
    imgPath = fullfile(inputFolder, imageFiles(k).name);
    img = imread(imgPath);
    grayImg = rgb2gray(img);
    resizedImg = imresize(grayImg, [480, 640]);
    imwrite(resizedImg, fullfile(outputFolder, imageFiles(k).name));
end

disp('Image preprocessing completed.');

% Initialize vehicle tracker
tracker = vision.PointTracker('MaxBidirectionalError', 1);
disp('Vehicle tracker initialized.');

frame = imread('preprocessed_frames/frame_00000.jpg');
bbox = [100, 100, 50, 50];  % Initialize bounding box coordinates (example values)
points = bbox2points(bbox);  % Convert bounding box to points
initialize(tracker, points, frame);
disp('Tracker initialized with points.');

videoReader = VideoReader(videoPath);  % Reinitialize VideoReader

% Ensure all frames are resized to the same dimensions as the initial frame
initialFrameSize = size(frame);

while hasFrame(videoReader)
    frame = readFrame(videoReader);
    grayFrame = rgb2gray(frame);
    resizedGrayFrame = imresize(grayFrame, initialFrameSize(1:2));  % Resize to match initial frame size
    
    [points, validity] = tracker(resizedGrayFrame);
    if any(validity)
        points = points(validity, :);
        frame = insertMarker(frame, points, '+', 'Color', 'red');
    end
    imshow(frame);
    pause(0.01);  % Adjust to control playback speed
end

disp('Vehicle tracking completed.');
