
# Setup android paths

# for ZSH
case "$OSTYPE" in
# Mac
darwin*)
  export JAVA_HOME=$(/usr/libexec/java_home -v1.8)
  export ANDROID_HOME=$HOME/Library/Android/sdk
  export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
  ;;
# Linux
linux*)
  export ANDROID_HOME=$HOME/Android/Sdk
  export ANDROID_SDK_ROOT=$HOME/Android/Sdk
  export PATH=${PATH}:/home/linuxbrew/.linuxbrew/lib/ruby/gems/2.7.0/bin
  ;;
esac

# COMMON
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export PATH=${PATH}:$ANDROID_HOME/build-tools/28.0.3/

