maintainer       "Sebastian Johnsson"
maintainer_email "sebastian@agiley.se"
license          "MIT"
description      "Configures the ssh daemon."
version          "0.1"

attribute 'sshd/port', 
  :description  =>  'The port ssh should be accessible on.',
  :required     =>  "recommended"

attribute 'sshd/permit_root_login',
  :description  =>  'Whether or not root logins should be permitted over ssh. Enter yes or no',
  :required     =>  "recommended"

