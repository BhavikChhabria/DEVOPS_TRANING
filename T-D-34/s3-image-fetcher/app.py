from flask import Flask, send_file, abort
import boto3
from botocore.exceptions import NoCredentialsError, PartialCredentialsError
import io

app = Flask(__name__)

# Initialize S3 client
s3_client = boto3.client('s3')

# Your S3 bucket name
BUCKET_NAME = 'your-private-s3-bucket-name'

@app.route('/image/<filename>')
def fetch_image(filename):
    try:
        # Fetch the image from S3
        s3_object = s3_client.get_object(Bucket=BUCKET_NAME, Key=filename)
        return send_file(io.BytesIO(s3_object['Body'].read()), mimetype='image/jpeg')
    except s3_client.exceptions.NoSuchKey:
        abort(404, description="File not found")
    except (NoCredentialsError, PartialCredentialsError):
        abort(403, description="Credentials not available")
    except Exception as e:
        abort(500, description=str(e))

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080)
