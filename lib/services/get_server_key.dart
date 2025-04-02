import 'package:googleapis_auth/auth_io.dart';

class GetServerKey {
  Future<String> getServerKeyToken() async {
    final scopes = [
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/firebase.database',
      'https://www.googleapis.com/auth/firebase.messaging',
    ];

    final client = await clientViaServiceAccount(
        ServiceAccountCredentials.fromJson({
          "type": "service_account",
          "project_id": "fir-tutorial-cfc61",
          "private_key_id": "c0e453313d8c61601ac84a54394695dffeabf4eb",
          "private_key":
              "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCxxH4rzwpXtbVP\nsex12J7EgZjdxDd4u3A8B7csT+rNn6gbza6GPnVhekbwxIHNKm+ZuridbZOD7vRK\nyfVjRkCLuicqlucHsjksGFM8xu2XfZehgN4j0fOdXpXUoJbpxHm0MQkMOFVY81ZM\n6NGNKi+Q72pMFz+B1VWICS87ZMiBq/wh6B8a7RB+BoSsi+FS9AnavKvhVF6B1UxV\nKSBALWojhfCU+VK5MySRgB6OnA3e1JSVyVTVZrEG6Halq4eMK7qKU9NVm3hmMppg\npBhhHOUO5BxVpRAkLcdsE8Cm21G+XoOvQKUWy55CPYTRTPGuzExQvWDikO3MTb1R\nEVL0Biq7AgMBAAECggEABIYQWGv706kqfiKNw3yfK4y4MDUPqaWGGm/mwnYusu3r\nkTzCsYbIkJHtnUlJRnMHEd6uAeBe5n9B7Hh+q/iX01zWrgwbJxeEoCKimX0SLaxz\n+X4E9e3+FZbYdgnIqzgYeDiabHjrDK9cBYS+qf7VGBuht0AeEVas+kJOX8pq50Py\nBRAZc3Y5C8urD/vl7QKms4qz1uQxo2BWKRopYRxm/CRIpC6b59gmLkglsJagZCd2\nNh2S4DBPxxZOQPwrteVLf39AQF23R2vnfGI4RNF814MOHZX4i1XfSG0XnJXsQ2C6\niGVgduu1dKnVJMqK92YHxH/vuh14VWpRydXjngSSwQKBgQDX0XNw2sN6HMQB/2Px\nP17zFVuzbx+XtLx0n8LD4qzy4JaOmgxSaQIaXhk6vmGxHC6llZQ2Y+Qn3/hKyef5\n/k89hxPrjUyA40FmsTBtnm/C6Wo20vOyFeEImNA30CfjudJQEiE4NTqYHjnS8OGj\n++2fMSNnGCiNLU74GXNAV8CHDwKBgQDS3W8Yn4Gj0ue7GHrx5uA/KdxGtmWR+wyS\neS19wY6dPxOnFjiNMv9SZzwzRpnVVXWYl9F/ZADxyhEprM8cwDghPYbXYsb1FeWp\nnMUQ6ka1MN8fIPh4TG9NC319sVagFbXdj9/DkvzonHgUKk/VTQmKBfDC87CeO9sI\n22b1HIeBlQKBgENpmkybGMow6AzTsG0v5UG63yz6Pf0OKHupV5YGXQ10l7KtbcHk\nKRMBZ5IQ28UNz4hLY8NlimPmMtFxpfNRu4C1i8RdG5N66PfhywXCophYfqPnWtW6\nvdMIoKl+bKdWaNo3/4ZmIgpYDqnUMjcdv0ilebB/PFN03qDimjxz7KCDAoGAbFH3\n+gwmSoPTKpdewNk7JPdaArE76Auw36WEKu+9VSXL8K9HibFC24/Qqv5/k8l8yVBj\n/C7hFVQaEPCGzFwp+Vlj5U0Gq2v+OG0iBphyji120MTdHt8U5d0bL/BjcYT1kcWQ\nyyS86rlGLgW2UPpsBg0bKuqINiDFWf1rHEr1iSkCgYA8RLlrU4pEZd2ppeiuuJjx\nero5IxBwbSV0nsELUw+JPB2pal96d/ot01GpOMqOiHVFiUu6lmCVKS5GVeD26BXF\n00mbMG8s5tkxkDAJhoxNsFTpeir0CXx8SywMONrQfpLB4ILzejJOGydM4d03r3MC\nAeAflFzr2YDTgnOoojkMbQ==\n-----END PRIVATE KEY-----\n",
          "client_email":
              "firebase-adminsdk-fbsvc@fir-tutorial-cfc61.iam.gserviceaccount.com",
          "client_id": "100472908179937681667",
          "auth_uri": "https://accounts.google.com/o/oauth2/auth",
          "token_uri": "https://oauth2.googleapis.com/token",
          "auth_provider_x509_cert_url":
              "https://www.googleapis.com/oauth2/v1/certs",
          "client_x509_cert_url":
              "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-fbsvc%40fir-tutorial-cfc61.iam.gserviceaccount.com",
          "universe_domain": "googleapis.com"
        }),
        scopes);

    final accessServerKey  = client.credentials.accessToken.data;
    return accessServerKey;
  }
}
