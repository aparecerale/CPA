package myPakage;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.DoubleWritable;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.mapreduce.lib.output.TextOutputFormat;

import java.io.IOException;
import java.util.Timer;
import java.util.TimerTask;

public class Driver {
    public Driver() throws IOException
    {
        Timer timer = new Timer();
        int delay = 0;//ms
        int period = 300000;//ms
        timer.schedule(new TimerTask() {
            Integer i = 1;
            public void run(){
                try{
                mySQL.genOriginData();
                // configuration should contain reference to your namenode
                FileSystem fs1 = FileSystem.get(new Configuration());
                // true stands for recursively deleting the folder you gave
                fs1.delete(new Path("dataDivideByUser/"), true);

                Configuration conf1 = new Configuration();

                Job job1 = Job.getInstance(conf1);
                job1.setMapperClass(DataDividerByUser.DataDividerMapper.class);
                job1.setReducerClass(DataDividerByUser.DataDividerReducer.class);

                job1.setJarByClass(DataDividerByUser.class);

                job1.setInputFormatClass(TextInputFormat.class);
                job1.setOutputFormatClass(TextOutputFormat.class);
                job1.setOutputKeyClass(IntWritable.class);
                job1.setOutputValueClass(Text.class);

                TextInputFormat.setInputPaths(job1, new Path("input/"));
                TextOutputFormat.setOutputPath(job1, new Path("dataDivideByUser/"));

                job1.waitForCompletion(true);
                //System.exit(job1.waitForCompletion(true) ? 0 : 1);

                // configuration should contain reference to your namenode
                FileSystem fs2 = FileSystem.get(new Configuration());
                // true stands for recursively deleting the folder you gave
                fs2.delete(new Path("coOccurrenceMatrixBuilder/"), true);
                Configuration conf2 = new Configuration();

                Job job2 = Job.getInstance(conf2);
                job2.setMapperClass(CoOccurrenceMatrixGenerator.MatrixGeneratorMapper.class);
                job2.setReducerClass(CoOccurrenceMatrixGenerator.MatrixGeneratorReducer.class);

                job2.setJarByClass(CoOccurrenceMatrixGenerator.class);

                job2.setInputFormatClass(TextInputFormat.class);
                job2.setOutputFormatClass(TextOutputFormat.class);
                job2.setOutputKeyClass(Text.class);
                job2.setOutputValueClass(IntWritable.class);

                TextInputFormat.setInputPaths(job2, new Path("dataDivideByUser/part-r-00000"));
                TextOutputFormat.setOutputPath(job2, new Path("coOccurrenceMatrixBuilder/"));

                job2.waitForCompletion(true);

                // configuration should contain reference to your namenode
                FileSystem fs3 = FileSystem.get(new Configuration());
                // true stands for recursively deleting the folder you gave
                fs3.delete(new Path("multiplication/"), true);
                Configuration conf3 = new Configuration();
                conf3.set("coOccurrencePath", "coOccurrenceMatrixBuilder/part-r-00000");

                Job job3 = Job.getInstance();
                job3.setMapperClass(Multiplication.MultiplicationMapper.class);
                job3.setReducerClass(Multiplication.MultiplicationReducer.class);

                job3.setJarByClass(Multiplication.class);

                job3.setInputFormatClass(TextInputFormat.class);
                job3.setOutputFormatClass(TextOutputFormat.class);
                job3.setOutputKeyClass(IntWritable.class);
                job3.setOutputValueClass(Text.class);
                job3.setMapOutputKeyClass(Text.class);
                job3.setMapOutputValueClass(DoubleWritable.class);

                TextInputFormat.setInputPaths(job3, new Path("input/"));
                TextOutputFormat.setOutputPath(job3, new Path("multiplication/"));

                job3.waitForCompletion(true);

                mySQL.deleteResult();
                // configuration should contain reference to your namenode
                FileSystem fs4 = FileSystem.get(new Configuration());
                // true stands for recursively deleting the folder you gave
                fs4.delete(new Path("recommenderListGenerator/"), true);
                Configuration conf4 = new Configuration();
                conf4.set("watchHistory", "input/userRating.txt");
                conf4.set("movieTitles", "movie_titles.txt");

                Job job4 = Job.getInstance(conf4);
                job4.setMapperClass(RecommenderListGenerator.RecommenderListGeneratorMapper.class);
                job4.setReducerClass(RecommenderListGenerator.RecommenderListGeneratorReducer.class);

                job4.setJarByClass(RecommenderListGenerator.class);

                job4.setInputFormatClass(TextInputFormat.class);
                job4.setOutputFormatClass(TextOutputFormat.class);
                job4.setOutputKeyClass(IntWritable.class);
                job4.setOutputValueClass(Text.class);

                TextInputFormat.setInputPaths(job4, new Path("multiplication/part-r-00000"));
                TextOutputFormat.setOutputPath(job4, new Path("recommenderListGenerator/"));

                //job4.waitForCompletion(true);
                job4.waitForCompletion(true);

                //System.out.println("Task running: " + i);
                //i++;
            } catch(IOException ie) {
                ie.printStackTrace();
            } catch (InterruptedException e) {
                    e.printStackTrace();
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
            }
        }, delay, period);
    }

	public static void main(String[] args) throws Exception {

		//input/ dataDivideByUser/ dataDivideByUser/part-r-00000 coOccurrenceMatrixBuilder/ coOccurrenceMatrixBuilder/part-r-00000 input/ multiplication/ input/userRating.txt movieTitles multiplication/part-r-00000 recommenderListGenerator/
        new Driver();

		/*
		DataDividerByUser dataDividerByUser = new DataDividerByUser();
		CoOccurrenceMatrixGenerator coOccurrenceMatrixGenerator = new CoOccurrenceMatrixGenerator();
		Multiplication multiplication = new Multiplication();
		RecommenderListGenerator generator = new RecommenderListGenerator();


		String[] path1 = {args[0], args[1]};
		String[] path2 = {args[2], args[3]};
		String[] path3 = {args[4], args[5], args[6]};
		String[] path4 = {args[7], args[8], args[9], args[10]};

		dataDividerByUser.main(path1);
		coOccurrenceMatrixGenerator.main(path2);
		multiplication.main(path3);
		generator.main(path4);
		*/
		/*
		String[] path1 = {args[0], args[1]};
		String[] path2 = {args[1], args[2]};
		String[] path3 = {args[4], args[0], args[3]};
		String[] path4 = {args[5], args[6], args[3], args[7]};
		
		dataDividerByUser.main(path1);
		coOccurrenceMatrixGenerator.main(path2);
		multiplication.main(path3);
		generator.main(path4);
		*/
	}

}
