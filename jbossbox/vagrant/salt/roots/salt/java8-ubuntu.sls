# This *.sls script contains the information for java8 jdk/jre installarion steps

add-java-ppa:
  cmd.run:
    - name: echo -e "\n" | add-apt-repository ppa:openjdk-r/ppa && apt-get update
    - user: root

jre8:
  cmd.run:
    - name: apt-get -y openjdk-8-jre
    - user: root
    - cwd: /tmp
    - unless: command -v java | grep "bin/java"

jdk8:
  cmd.run:
    - name: apt-get update && apt-get -y install openjdk-8-jdk-headless
    - user: root
    - cwd: /tmp
    - unless: command -v java | grep "bin/java"