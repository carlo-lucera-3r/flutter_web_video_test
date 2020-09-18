# video_test

Test project for flutter web Video Element autoplay

## Info

Project used for testing a bug when navigating back and forth from a page that is using a VideoElement with autoplay

## How to test

to test this issue run the project using

`flutter run -d chrome`

On run you will find a video and a button, clicking on a button will send you to a second page with only a text

#### Expected result:
Going back the video should continue to play

#### Actual result:
Going back the video doesn't restart


## Configurations:
The issue is currently present with this configuration

```
[✓] Flutter (Channel dev, 1.22.0-1.0.pre, on Linux, locale en_US.UTF-8)
    • Flutter version 1.22.0-1.0.pre at /home/carlo/flutter
    • Framework revision ce40de69b7 (4 weeks ago), 2020-08-20 07:31:50 -0700
    • Engine revision 81027ab0cc
    • Dart version 2.10.0 (build 2.10.0-45.0.dev)

Chrome (web)     • chrome     • web-javascript • Google Chrome 84.0.4147.125
```