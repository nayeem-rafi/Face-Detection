% Load the built-in face detector
faceDetector = vision.CascadeObjectDetector();

% Read the input image
img = imread('image.jpg');  % Replace 'image.jpg' with your image file

% Convert to grayscale (face detection works better on grayscale images)
grayImg = rgb2gray(img);

% Detect faces in the grayscale image
bbox = step(faceDetector, grayImg);

% Check if faces are detected
if ~isempty(bbox)
    % Annotate the detected faces
    detectedImg = insertObjectAnnotation(img, 'rectangle', bbox, 'Face');
    % Display the result
    imshow(detectedImg);
    title('Detected Faces');
else
    % If no faces are detected, display the original image
    imshow(img);
    title('No Faces Detected');
end
