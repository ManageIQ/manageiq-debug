FROM manageiq/manageiq-base:latest
ADD container-assets/perf-test /usr/local/bin
CMD [ "/usr/local/bin/perf-test" ]
