FROM public.ecr.aws/lambda/python:3.8

COPY requirements.txt  .
RUN  pip3 install -r requirements.txt --target "${LAMBDA_TASK_ROOT}"

# Copy function code
COPY minerva_analysis ${LAMBDA_TASK_ROOT}/minerva_analysis
COPY serverless_wsgi.py ${LAMBDA_TASK_ROOT}
COPY wsgi_handler.py ${LAMBDA_TASK_ROOT}
COPY .serverless-wsgi ${LAMBDA_TASK_ROOT}

# Install the function's dependencies using file requirements.txt
# from your project folder.

# Set the CMD to your handler (could also be done as a parameter override outside of the Dockerfile)
CMD [ "wsgi_handler.handler" ]
