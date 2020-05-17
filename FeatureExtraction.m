boxImage = imread('1-Front.jpg');
J = rgb2gray(boxImage);

boxPoints = detectSURFFeatures(J);
figure;

title('100 Strongest Feature Points from Box Image');
imshow(J);
hold on;
plot(boxPoints.selectStrongest(100));

sceneImage = rgb2gray(imread('all-front-back.jpg'));
%[size_x size_y] = size(sceneImage);
scenePoints = detectSURFFeatures(sceneImage);
[boxFeatures, boxPoints] = extractFeatures(J, boxPoints);
[sceneFeatures, scenePoints] = extractFeatures(sceneImage, scenePoints);
boxPairs= matchFeatures(boxFeatures, sceneFeatures);

%regionprops

matchedBoxPoints = boxPoints(boxPairs(:, 1), :);
matchedScenePoints = scenePoints(boxPairs(:, 2), :);
[tform, inlierBoxPoints, inlierScenePoints] = ...
    estimateGeometricTransform(matchedBoxPoints, matchedScenePoints, 'affine');
boxPolygon = [1, 1;...                           % top-left
        size(boxImage, 2), 1;...                 % top-right
        size(boxImage, 2), size(boxImage, 1);... % bottom-right
        1, size(boxImage, 1);...                 % bottom-left
        1, 1];                   % top-left again to close the polygon
    newBoxPolygon = transformPointsForward(tform, boxPolygon);
    figure;
imshow(sceneImage);
hold on;
line(newBoxPolygon(:, 1), newBoxPolygon(:, 2), 'Color', 'y');
x1=100
x2=200
y1=100
y2=200

title('Detected Box');
