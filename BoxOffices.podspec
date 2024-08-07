#
#  Be sure to run `pod spec lint BoxOffices.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  spec.name         = "BoxOffices"
  spec.version      = "1.0.0"
  spec.summary      = "영화진흥위원회에서 제공하는 API를 활용해 영화 관련 정보를 가져옵니다."

  spec.description  = <<-DESC
      Movies는 영화진흥위원회에서 제공하는 API를 통해 영화 관련 정보들을 가져올 수 있게 합니다.
                   DESC

  spec.homepage     = "https://github.com/ishiftEbko/package-boxoffices"
  
  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author             = { "ebko" => "ebko@ishift.co.kr" }
  
  spec.ios.deployment_target = "15.0"
  spec.swift_version = "5.10"
 
  spec.source       = { :git => "https://github.com/ishiftEbko/package-boxoffices.git", :tag => "#{spec.version}" }

  spec.source_files  = "Sources/BoxOffices/**/*"
  
end
