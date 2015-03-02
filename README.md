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
| SPARK_WORKERS_COUNT | The number of active workers. |
| SPARK_APPLICATIONS_ACTIVE_COUNT | The number of active applications. |
| SPARK_APPLICATIONS_COMPLETED_COUNT | The number of completed applications. |
| SPARK_JOBS_COUNT | The number of active jobs.|
| SPARK_JOBS_FAILED_COUNT | The number of jobs that failed. |
| SPARK_STAGES_COUNT | The number of active stages |
| SPARK_STAGES_FAILED | The number of stages that failed |
| SPARK_MAX_TASK_TIME | The maximum duration of all the task ran.
| SPARK_MAX_APPLICATION_TIME | The maximum duration of applications ran. |
