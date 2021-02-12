FROM registry.access.redhat.com/ubi8/ubi-minimal

ENV NODE_ENV=production
ENV NODE_BUILD_VERSION=12.20.1

ENV PATH="/node-v${NODE_BUILD_VERSION}-linux-s390x/bin/:${PATH}"
RUN wget https://nodejs.org/download/release/v${NODE_BUILD_VERSION}/node-v${NODE_BUILD_VERSION}-linux-ppc64le.tar.gz && \
    tar -xf node-v${NODE_BUILD_VERSION}-linux-s390x.tar.gz && \
    rm -rf node-v${NODE_BUILD_VERSION}-linux-s390x.tar.gz && \
	node -v && \
    npm -v

# Testing if this will speed up concurrent builds by using cache for node_modules
COPY --chown=node package.json /home/node/vibha
COPY --chown=node .npmrc /home/node/.npmrc
