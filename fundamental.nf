process:
input:
can accept several inputs. the order in the workflow determines which goes to which input in the process

output: 
1. does not determine what output will be created.
2. declares what is the expected output, so that Nextflow can look for it once execution is complete.
3. Output produced that doesn't match what is declared in the output block will not be passed to downstream processes.
4. a process's output is auomaticcaly packaged into a channel called: <process>.out. can be select using index: <process>.out[0]. it's too easy to grab the wrong index.
5. using emit to tag  outpus which convenient later use in downstream workflow
  path: tells Nextflow this should be handled as a path (includes both directory paths and files). MUST use double quotes around the output filename expression
  val: 


script:
can add arbitrary code in the script outside of """
  


workflow: name is optional
  provide the inputs to a process in the EXACT SAME ORDER as they are listed in the input definition block of the process.


after run, it creates "work" folder. For each process call, Nextflow creates a nested subdirectory, 



nextflow run hello-world.nf -resume


parameter:The parameter name (at the workflow level) does not have to match the input variable name (at the process level).
nextflow run hello-world.nf --greeting 'Bonjour le monde!' #Parameters take a double hyphen (--). Nextflow setting take a single hyphen (-).
  defaut parameters

nextflow clean -before golden_cantor -n #https://www.nextflow.io/docs/latest/reference/cli.html#clean
extflow clean -before golden_cantor -f # golden_cantor is the name of the run, can find  in square brackets in the Launching (...) console output line.

nextflow hello-world.nf -ansi-log false #if the process works several times on the same channel, it only show one job ID, using this can show every job ID. every time one process works, it make a nnew folrder


Channel
channel fatories: used to set up a channel
  1. Channel.of: create a channel containing a/more values
  greeting_ch = Channel.of('Hello Channels!')
  2. Channel.fromList:unpack the contents of an array and emits them as individual items.
  3. Channel.fromPath(): has some built-in functionality for handling file paths. it get the path of the files.
channel operators: to transform the contents of a channel.
  1. flatten(): parse input values from a list. unpack the contents of an array and emits them as individual items.
  2. view();  a debugging tool, like a print() statement in Python, 
  3. splitCsv(): parse and split CSV-formatted text.reads each line into an array, and each comma-separated value in the line becomes an element in the array. 
  4. map(): do all kinds of mappings to the contents of a channel.
  5. collect(): 



  In practice, naming files based on the input data itself is almost always impractical. The better way to generate dynamic filenames is to pass metadata to a process along with the input files. The metadata is typically provided via a 'sample sheet' or equivalents. You'll learn how to do that later in your Nextflow training.
