### **Project Title: High Availability Web Application with OCI DNS Zone Management**

---

### **Objective**  
Design and implement a high-availability infrastructure for a web application using Oracle Cloud Infrastructure (OCI) DNS Zone Management. The project will cover:  
- Managed zone configuration.  
- Creating and managing DNS records (A, CNAME, TXT, etc.).  
- Setting up DNS failover and load balancing.  
- Integrating with other OCI services, such as Load Balancer and Compute Instances.  

---

### **Steps**

#### **1. Initial Setup**
- **Create a Managed Zone in OCI DNS**:  
  - Set up a **managed zone** for your domain (use a personal domain or a free one).  
  - Add basic DNS records:  
    - **A Record** pointing to the IP of a Compute Instance.  
    - **CNAME Record** for service aliases.  

#### **2. Provision Infrastructure**
- **Compute Instances**:  
  - Deploy two instances in different OCI regions.  
  - Install a lightweight web server (e.g., Nginx or Apache) on each instance.  

- **Load Balancer**:  
  - Set up an OCI Load Balancer to distribute traffic across the Compute Instances.  

#### **3. Configure DNS Failover**
- **Enable Failover**:  
  - Configure **Health Checks** to monitor the status of Compute Instances.  
  - Set up a **Failover Policy** to redirect traffic to the healthy instance in case of failure.  

#### **4. Subdomains and Customizations**
- Create subdomains for the application:  
  - **api.yourdomain.com** for the backend.  
  - **www.yourdomain.com** for the frontend.  
  - **mail.yourdomain.com** for email services (using an MX record).  

#### **5. Security and Monitoring**
- **Enhance DNS Security**:  
  - Enable **DNSSEC** to secure your managed zone.  
  - Add **TXT Records** for SPF/DKIM configurations, if needed.  

- **Monitor DNS Activity**:  
  - Use **OCI Monitoring** to track DNS queries and set up alerts.  

#### **6. Testing and Validation**
- Verify DNS resolution with tools like `nslookup` and `dig`.  
- Simulate a failure on one Compute Instance and validate the failover process.  
- Check load distribution across instances using the Load Balancer.  

---

### **OCI Services Used**
1. **DNS Zone Management**: Managed zones, failover policies, DNS records.  
2. **Compute Instances**: Infrastructure for the web application.  
3. **Load Balancer**: Traffic distribution across instances.  
4. **Health Checks**: Monitor instance availability.  
5. **OCI Monitoring**: Track and analyze DNS activity.  
6. **DNSSEC**: Enhance DNS security.  

    +------------------------+
    |      End Users         |
    +------------------------+
                 |
                 ▼
       +-------------------+
       |    OCI DNS        |
       |   (Managed Zone)  |
       +-------------------+
                 |
                 ▼
       +-------------------+
       |  OCI Load Balancer|
       +-------------------+
            /         \
           /           \
+----------------+ +----------------+
|  Compute (R1)  | |  Compute (R2)  |
|  Nginx/Apache  | |  Nginx/Apache  |
+----------------+ +----------------+

---

### **Additional Challenges**
- Implement **GeoDNS** to route users based on geographic location.  
- Integrate with a CI/CD pipeline to update DNS records automatically during deployments.  
- Test zone failover scenarios to understand real-time behavior.  

This project provides hands-on experience with **OCI DNS Zone Management**, while also exploring integration with other essential Oracle Cloud services.

### **DOCs**
https://docs.oracle.com/en/solutions/automate-dns-pz-entries-with-functions/index.html#GUID-5B8FD72C-7BCB-4B20-85FA-3A08A81EDB23


