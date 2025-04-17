# Static Website Hosting on Google Cloud Storage - Project Documentation


## Initial Setup of Google Cloud

The journey began with creating a **Google Cloud account** and setting up a new project within the **Google Cloud Console**. The project was named `ahmed-jemaa`, which served as the environment for hosting the static website.

After setting up the project, the next step was to **configure IAM roles** to ensure proper access control. I followed the **least privilege** principle by assigning limited roles to users and service accounts to avoid unnecessary permissions.

### **IAM Roles Setup**

For security purposes, I configured the project so that only specific roles could access and manage resources. The roles assigned were as follows:
- **Compute Viewer**: For users who need read-only access to compute resources.
- **Service Account User**: Allowing the user to interact with service accounts.
- **Storage Admin**: To manage the **Google Cloud Storage** resources.
- **Storage Object Viewer**: To grant access to **read-only** access to the objects in the storage bucket.

This **restricted access** ensures that only authorized individuals or services can modify resources, providing an extra layer of security.

![IAM Setup with Limited Permissions](../../1-setupIAMwithlimitedpermision.png)

## Bucket Creation for Static Website Hosting

After setting up the project and IAM roles, I moved on to creating the **Google Cloud Storage (GCS)** buckets. I created two buckets for hosting the static website: one for the **dev** environment and one for **prod**.

- **Bucket 1**: `my-static-site-dev` for the development environment.
- **Bucket 2**: `my-static-site-prod` for the production environment.

### **Access Control Configuration**

For **access control**, I chose to enable **Uniform bucket-level access**. This ensured that access to objects in the bucket is managed via **IAM** roles instead of **Access Control Lists (ACLs)**. The **Uniform access control** allows for a cleaner, more manageable setup and better security practices, as everything is controlled at the bucket level.


![GCS Bucket Setup with Only Object Viewer](../../2-setupbucketwithonlyobjectviewer.png)

## Website Configuration and Permissions

Once the buckets were created, I uploaded the **static files** for the website, including the `index.html` and `404.html` pages. I configured the **website hosting** options within the GCS bucket settings, specifying `index.html` as the **main page** and `404.html` as the error page.

### **Granting Public Access**

After uploading the files, I needed to make the website publicly accessible. To do this, I navigated to the **Permissions** tab in the GCS bucket settings and added the **allUsers** group. By assigning the **Storage Object Viewer** role to `allUsers`, I made the `index.html` file publicly accessible.

