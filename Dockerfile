FROM registry.access.redhat.com/ubi7/nodejs-14
LABEL "io.openshift.s2i.build.image"="registry.redhat.io/ubi7/nodejs-14" \
      "io.openshift.s2i.build.commit.author"="Chris Chase <cchase@redhat.com>" \
      "io.openshift.s2i.build.commit.date"="Tue Oct 26 21:10:24 2021 -0400" \
      "io.openshift.s2i.build.commit.id"="e497b0a9619c2501d8389238c28be66e2f483592" \
      "io.openshift.s2i.build.commit.ref"="dev" \
      "io.openshift.s2i.build.commit.message"="Updated to hide video if kafka is not connected." \
      "io.openshift.s2i.build.source-location"="/home/gmoutier/Dev/repos/IBM-PLT/car-app/." \
      "io.k8s.display-name"="car-app:0.0.1"

USER root
# Copying in source code
COPY . /tmp/src
# Change file ownership to the assemble user. Builder image must support chown command.
RUN chown -R 1001:0 /tmp/src
USER 1001
# Assemble script sourced from builder image based on user input or image metadata.
# If this file does not exist in the image, the build will fail.
RUN /usr/libexec/s2i/assemble
# Run script sourced from builder image based on user input or image metadata.
# If this file does not exist in the image, the build will fail.
CMD /usr/libexec/s2i/run
