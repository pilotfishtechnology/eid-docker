FROM pilotfishtechnology/eidashboard:22R1
ENV JAVA_OPTS="-Xms1g -Xmx3g"
COPY ./pflicense.key /opt/pilotfish/license/pflicense.key
