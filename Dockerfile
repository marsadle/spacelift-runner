FROM public.ecr.aws/spacelift/runner-terraform:latest

# Run setup as root user
USER root

# Add CloudPosse's package repository
ADD https://apk.cloudposse.com/ops@cloudposse.com.rsa.pub /etc/apk/keys/
RUN echo "@cloudposse https://apk.cloudposse.com/3.14/vendor" >> /etc/apk/repositories

# Add bash and atmos
RUN apk add -u bash atmos@cloudposse gcompat

# Update AWS CLI v2
RUN apk add --no-cache python3 py3-pip \
  && pip3 install --upgrade pip \
  && pip3 install awscli \
  && rm -rf /var/cache/apk/*

# Switch back to spacelift user
USER spacelift

# Add workspace's ./bin folder to PATH
ENV PATH="/mnt/workspace/source/bin:${PATH}"
