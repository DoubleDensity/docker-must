# must: A More Useful Syslog Test tool

The must syslog generator in a Docker container; rapidly generate sample event data to load test a syslog receiver, SIEM, Splunk or similar.

From the official website:

> "Using templated message formats with customisable placeholders, must allows more intelligent testing of syslog receivers with realistic data, as well as longer soak testing and stress testing.
> must was created to fill a gap found when trying to stress test Splunk as real, indexable and meaningful data was needed."

[MUST Website](http://sourceforge.net/p/mustsyslog/wiki/Home/)

## Quick Start

Currently this image only supports two parameters; one to specify the target host for the generated events, and the second to specify the port.

The sample jobs included with the must distribution have been added here under app/jobs and the EPS rate for both has been set to the maximum. Upon each invocation a random job will be chosen from the jobs directory.

For maximum sustained load generation ability, must will execute the job indefinitely until the container is stopped.

* `host` - the target address for the syslog reciever
* `port` - target port

```bash
docker run -it --net=host -e host="192.168.69.50" -e port="3514" quay.io/doubledensity/must
```

[![Docker Repository on Quay](https://quay.io/repository/doubledensity/must/status "Docker Repository on Quay")](https://quay.io/repository/doubledensity/must)