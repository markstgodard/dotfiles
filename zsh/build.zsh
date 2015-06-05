# travis
[ -f /Users/mark/.travis/travis.sh ] && source /Users/mark/.travis/travis.sh

# Gradle
export GRADLE_HOME=/Users/mark/Development/tools/gradle-2.1
export PATH=$GRADLE_HOME/bin:$PATH

# Ant
export ANT_HOME=~/Development/tools/apache-ant-1.9.4

# Maven
export MAVEN_HOME=~/Development/tools/apache-maven-3.2.3
export PATH=$PATH:/usr/local/sbin:$ANT_HOME/bin:$MAVEN_HOME/bin:/usr/local/bin
