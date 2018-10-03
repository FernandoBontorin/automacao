# Automacao

Simple sample of infrastructure automation

## About
Created for a Proof-of-Concept goals, developed to works only in Windows 10

## Requirements

* [Chef DK 3.3.23](https://downloads.chef.io/chefdk/)
* [Java JDK --only the install archive](http://www.oracle.com/technetwork/java/javase/downloads/index.html)

## Usage

Put the jdk*.exe in dir /files and rename to jdk.exe and type in console (cmd or powershell)
'''sh
chef-client --local-mode --runlist 'recipe[automacao]'
'''