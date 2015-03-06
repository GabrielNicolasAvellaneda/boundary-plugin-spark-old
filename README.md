# boundary-plugin-spark
A Boundary spark plugin that collects metrics from the MetricsServlet sink. http://spark.apache.org/docs/1.2.0/monitoring.html

### Supported OS
|    OS   | Linux | Windows | OS X |
|:-------:|:-----:|:-------:|:----:|
|Supported|   v   |    v    |  v   |


### Plugin setup
MetricsServlet is added by default as a sink in master, worker and client driver.
See the conf/metrics.properties file on you Spark installation for more details.

You can also enable the *jvm source* for instance master, worker, driver and executor to get detailed metrics of the JVM.

### Metrics collected
Tracks the following metrics for Spark.

| Metric Name | Description |
|:-----------:|:-----------:|
| SPARK_MASTER_WORKERS_COUNT | The number of active workers on the master. |
| SPARK_MASTER_APPLICATIONS_RUNNING_COUNT | Running application count on the master. |
| SPARK_MASTER_APPLICATIONS_WAITING_COUNT | Waiting application count on the master. |
| SPARK_MASTER_JVM_MEMORY_USED | Memory used by the JVM on the master. |
| SPARK_MASTER_JVM_MEMORY_COMMITTED | Memory committed by the JVM on the master. |
| SPARK_MASTER_JVM_HEAP_MEMORY_USED | Heap memory used by the JVM on the master. |
| SPARK_MASTER_JVM_HEAP_MEMORY_USAGE | Percentage of heap memory used by the JVM on the master. |
| SPARK_MASTER_JVM_NONHEAP_MEMORY_COMMITTED | Non-heap memory committed by the JVM on the master. |
| SPARK_MASTER_JVM_NONHEAP_MEMORY_USED | Non-heap memory used by the JVM on the master. |
| SPARK_MASTER_JVM_NONHEAP_MEMORY_USAGE | Percentage of non-heap memory usage by the JVM on the master. |



| SPARK_JOBS_COUNT | The number of active jobs.|
| SPARK_JOBS_FAILED_COUNT | The number of jobs that failed. |
| SPARK_STAGES_COUNT | The number of active stages |
| SPARK_STAGES_FAILED | The number of stages that failed |
| SPARK_MAX_TASK_TIME | The maximum duration of all the task ran.
| SPARK_MAX_APPLICATION_TIME | The maximum duration of applications ran. |
