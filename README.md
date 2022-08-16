Fake Media Detection

## Table of contents

- [Description](#description)
- [Languages and Technologies](#languages-and-technologies)
- [Notes](#notes)

## Description

This mobile application is written using Android studio (dart, flutter and firebase). Programming Language used in server side programming is dart, The core activities of this process are:

- Registration Screen: it creates an account that enters the email ,password and retype the password and it signs up, if it is not the first time for the user to open the application then there would be a saved account for him so it can let him easily enter by logging in , by typing the email and password then sign in. Then, after it logs in it immediately opens the Home Screen and there would be three options.
- Home Screen (Scan): The first tab is to scan by the link, or the second option is to upload the video from the storage. After uploading the video, we press scan, and it scans the video. We also have in the Home Screen another
- Home Screen (Generate): The Second tab is generate, and it goes like if we will already have a list of videos in the library of the user and the users themselves can choose one of them and uploads whatever the picture they want from the storage, then generates the video.
- Home Screen (History): The third tab called history, the user chooses this tap after pressing either scan or generate , it shows the results of scanned and generated videos.

## Languages and technologies used

- Flutter
- Android Studio
- Firebase

## Notes

- Machine Learning model for detecting and generating fake videos are linked via api queries containing the video url from Firebase Cloud Storage
