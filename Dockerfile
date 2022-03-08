FROM pilotfishtechnology/eidashboard:latest
ENV JAVA_OPTS="-Xms1g -Xmx3g"
COPY ./pflicense.key /opt/pilotfish/license/pflicense.key
