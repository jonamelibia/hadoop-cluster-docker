#!/bin/bash

# test the hadoop cluster by running wordcount

# create input files 
mkdir input
wget "https://www.gutenberg.org/files/2701/2701-0.txt" >input2/file.txt
echo -e input/file.txt
# create input directory on HDFS
hadoop fs -mkdir -p input

# put input files to HDFS
hdfs dfs -put ./input/* input

# run wordcount 
hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/sources/hadoop-mapreduce-examples-2.7.2-sources.jar org.apache.hadoop.examples.WordCount input output

# print the input files
echo -e "\input file.txt:"
hdfs dfs -cat input/file.txt


# print the output of wordcount
echo -e "\nwordcount output:"
hdfs dfs -cat output/part-r-00000


