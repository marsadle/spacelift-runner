FROM public.ecr.aws/spacelift/runner-terraform:latest

# Add CloudPosse's package repository
ADD https://apk.cloudposse.com/ops@cloudposse.com.rsa.pub /etc/apk/keys/
RUN echo "@cloudposse https://apk.cloudposse.com/3.11/vendor" >> /etc/apk/repositories

# Add bash and atmos
RUN apk add -u bash atmos@cloudposse

# Add workspace's ./bin folder to PATH
ENV PATH="/mnt/workspace/source/bin:${PATH}"
