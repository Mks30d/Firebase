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
          "private_key_id": "8ace01f7eb1626e0819fdf5283885d435bdf297e",
          "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDATJtkvzAGF2AZ\nrNzPZCvPB6jhOtgSGENhE//lnJDhcqFbd8tItPm6Ryp+cpeUpfbGfQnDdddFzRD+\ngdkpwcJOKslD6B+bKxFs76SCnqxB/qaJG/P9IUWyFRLh6I4iAzEN+8Ie92ajHyT6\nCDAco1bFLte7pFCWiFL7bouIeDRbE9onNORvSEpYghiLb7U5OdHhvT5DH2sRT24M\nb/kkZi9QkVX18cnpmnY+SRfjk6cOMXUa9RJyV8MzhP1RylPE6LDCMKlH72zZneMO\nfJBcFaCdqnzk1R72SqtZS9bLy5A6JdkA0T34vJZOAclkX9tc73HiEN5dvnWsZb5v\nhXoXurbZAgMBAAECggEAGE6Wpdl03JA/2X78OkrTLswtEKs7fK4Mdkzs3702owi2\nVLWDwKD/oAg22tzpRCTmWJidj1Np7qzJJSKMrLaNNQw7fJXuyNJc1YRFKy2bYIwr\nyND7uldmU+hOBrg6nxoALWBRXVCwbJYXOnOmgTg0U6BkLJfMh/qbYqTKhmmLVKep\nYrMEGLNHdwX8rHRjZxUdKvR51rOuSgembmGd1vKUSS9VCvAzaA+o9l5goRJdOODO\njvVob7kNGsZoJBNlfqVEbZF1hqJgP7tl4N3DpXrv9qjLSR2QjAC4tUtMiCVROylF\nIoIS9w1NXeIP3EO0YPyZTk+esyA6l56XC0eqCsat8QKBgQD0zAQ308wfp8iAx9bv\nxMMxN3diOm4Z4zAZlBdFRc10U5IIcmYhIdJe/CO/68MpJreAG5QqMqiJxlKcamvJ\nqqCzbtb84Dw6ddDF6InoPGvTzfhLArZXaqyt6QgXCDq+UvP0NZx/31nWi3C8xH76\n+BCfnh8tma0GHxrxJ2NiL4FMcwKBgQDJGYo01hind5JLLENcJ2/x4D2NkN2pwcdN\n2xxfjIFkOFe9b5sJzruTDgCJzPPGHe0uPLDnGe/ZA8Vi7bATIAFvlDAq+wxa/jQI\nX4/gBQHEWzr5FiJvu4oRB8/99TNTrkGVUXkN6uZCUboI2CKePYgZQJP2Jp6rwWt6\nCINVwt8IgwKBgQDU3E5SqSWW5ROQ/7RjW2oLctqpnHs+oXGi3EX7432KyFx0Yd1y\ns/E0zPTdHsneD5+CkvicVN5+pugQwO0nN+py/E+PJgDZKLc4UEMSoO92BmT//MTH\ncKfktXxmYq6J7qHY2YFTI8j/qNKIIij0XB5AXYNo6Hcumn+X8JMXvo0lBwKBgAnV\noumkkr4V3eSpPH4UO6hDhB8ZN43muR14mrGdiHJjQv8zpwxavNebNrGGgWFt8zxw\noWIb5ZviUFPfNd4pkYhoYdaoQlls1xSVv85/0C9PGto1l+eI716X2DceN61e9zwb\nKOViWHJj1so57693aOF7RAEksFvL8LqeEfYuuoOLAoGAbjTiy0ckMZdO+pSmbFsg\n8Io+W8mUUdGHu3vLRX4ZTFG7l3ekbAsrnzbfFHsLmLPouj6GobihtH8DFuhoT8hg\nneuc9eyQNEh6od7gJ2G3DWZ+Tx6QC5epW4WnhxqBWK3aaR5dzONbGajA/3H7l6Uv\ncZC6wfwis4rDVJjt8Q6yONU=\n-----END PRIVATE KEY-----\n",
          "client_email": "firebase-adminsdk-fbsvc@fir-tutorial-cfc61.iam.gserviceaccount.com",
          "client_id": "100472908179937681667",
          "auth_uri": "https://accounts.google.com/o/oauth2/auth",
          "token_uri": "https://oauth2.googleapis.com/token",
          "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
          "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-fbsvc%40fir-tutorial-cfc61.iam.gserviceaccount.com",
          "universe_domain": "googleapis.com"
        }),
        scopes);

    final accessServerKey = client.credentials.accessToken.data;
    // print("accessServerKey:----- $accessServerKey");
    return accessServerKey;
  }
}
