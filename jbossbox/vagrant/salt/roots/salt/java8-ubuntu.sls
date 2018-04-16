# This *.sls script contains the information for java8 jdk/jre installarion steps

add-java-ppa:
  cmd.run:
    - name: echo -e "\n" | add-apt-repository ppa:webupd8team/java && apt-get update
    - user: root

jdk8:
  cmd.run:
    - name: apt-get install -y oracle-java8-installer && apt-get update
    - user: root
    - unless: command -v java | grep "bin/java"
