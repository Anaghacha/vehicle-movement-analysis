# Video Analysis Tool

This MATLAB project provides a comprehensive video analysis tool designed for extracting, preprocessing, and analyzing video frames, with a focus on vehicle tracking and traffic flow analysis. The tool is user-friendly and efficient, making it ideal for various video analysis applications.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
- [File Structure](#file-structure)
- [Steps Taken](#steps-taken)
- [Example](#example)
- [Contributing](#contributing)
-
- [Authors](#authors)
- [Acknowledgments](#acknowledgments)

## Features

- **Frame Extraction**: Extracts individual frames from a video file.
- **Image Preprocessing**: Converts frames to grayscale and resizes them.
- **Vehicle Tracking**: Tracks vehicles across frames using point tracking.
- **Traffic Flow Analysis**: Analyzes traffic flow and provides visualization.

## Getting Started

### Prerequisites

- MATLAB (R2019b or later)
- Computer Vision Toolbox

### Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/yourusername/video-analysis-tool.git
    cd video-analysis-tool
    ```

2. Open MATLAB and navigate to the project directory.

3. Ensure you have the required toolboxes installed:
    - Computer Vision Toolbox

### Usage

1. Run the `main.m` script in MATLAB:
    ```sh
    main
    ```

2. A file dialog will appear. Select the video file you want to analyze (MP4 or AVI format).

3. The tool will automatically extract frames, preprocess images, and track vehicles.

4. The output will be displayed in the MATLAB figure window, showing tracked points on the video frames.

### File Structure

- `main.m`: Main script to run the video analysis tool.
- `functions/`: Directory containing helper functions for frame extraction, preprocessing, and tracking.
- `output_frames/`: Directory where extracted frames are saved.
- `preprocessed_frames/`: Directory where preprocessed frames are saved.

## Steps Taken

### 1. Frame Extraction

The first step in the process is extracting individual frames from the input video. This is achieved using the `VideoReader` class in MATLAB. Each frame is saved as a separate image file in the `output_frames` directory.

### 2. Image Preprocessing

Once the frames are extracted, they undergo preprocessing. This involves converting each frame to grayscale and resizing it to a standard dimension (480x640 pixels). The preprocessed frames are saved in the `preprocessed_frames` directory.

### 3. Vehicle Tracking

The core functionality of this tool is tracking vehicles across the frames. Using the Computer Vision Toolbox, we initialize a `vision.PointTracker` object. The tracker is initialized with points from the first frame, and subsequent frames are analyzed to track these points. Tracked points are visualized on each frame with red markers.

### 4. Traffic Flow Analysis

In addition to vehicle tracking, the tool provides basic traffic flow analysis. This feature is intended to be expanded with more advanced analytics and visualizations in future updates.

## Example

To see the tool in action, follow these steps:

1. Run the `main.m` script.
2. Select a sample video file when prompted by the file dialog.
3. Watch as the tool extracts frames, preprocesses them, and tracks vehicles, displaying the results in real-time.

## Contributing

We welcome contributions to enhance the functionality of this tool. To contribute:

1. Fork the repository.
2. Create a new branch:
    ```sh
    git checkout -b feature/your-feature-name
    ```
3. Make your changes and commit them:
    ```sh
    git commit -m "Add some feature"
    ```
4. Push to the branch:
    ```sh
    git push origin feature/your-feature-name
    ```
5. Open a pull request.



## Authors

- This has been done in collaboration with
- Anagha Challa : https://github.com/Anaghacha
- Anjali S Kumari :
- Sukanya Keshari :https://github.com/keshari21

## Acknowledgments

- Inspiration and code snippets were taken from various sources, including MATLAB documentation and online tutorials.
- Special thanks to the hackathon organizers for the opportunity to develop this project.

