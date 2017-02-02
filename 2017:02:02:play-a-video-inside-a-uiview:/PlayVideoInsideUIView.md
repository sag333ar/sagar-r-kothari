### Put following lines of code in your class

In this case, `SagarRKothari.mp4` is the video which is part of Application.
Here, I'm going to play video in an UIImageView named 'imgV'

```Objective-C
- (void)playVideo {
    NSString *videoPath = [[NSBundle mainBundle] pathForResource:@"SagarRKothari" ofType:@"mp4"];
    NSURL *videoURL = [NSURL fileURLWithPath:videoPath];

    AVPlayer *player = [AVPlayer playerWithURL:videoURL];
    AVPlayerLayer *layer = [AVPlayerLayer layer];
    [layer setPlayer:player];
    [layer setFrame:self.imgV.bounds];
    [layer setBackgroundColor:[UIColor clearColor].CGColor];
    [layer setVideoGravity:AVLayerVideoGravityResizeAspect];

    [self.imgV.layer addSublayer:layer];

    [player play];
}
```

```Swift
func playVideo() {
	if let moviePath = Bundle.main.path(forResource: "SagarRKothari", ofType: "mov") {
		let movieURL = URL(fileURLWithPath: moviePath)
		let player = AVPlayer(url: movieURL)
		let playerLayer = AVPlayerLayer()
		playerLayer.player = player
		playerLayer.frame = self.imgV.bounds
		playerLayer.backgroundColor = UIColor.clear.cgColor
		playerLayer.videoGravity = AVLayerVideoGravityResizeAspect
		self.imgV.layer.addSublayer(playerLayer)
		player.play()
	}
}
```

# Download Source code

Run following command.

```
svn checkout https://github.com/sag333ar/sagarrkothari.com.git/trunk/2017\:02\:02\:play-a-video-inside-a-uiview\:
```