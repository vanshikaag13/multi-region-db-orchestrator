##CloudSyncDB Overview**  
This project automates **cross-region database replication** and **failover** for AWS RDS instances using Terraform, Jenkins, and other AWS services. It ensures high availability, minimal downtime, and automated remediation during failures, providing an optimized infrastructure for business-critical applications.

---

## **Key Components**  

### 1. **Terraform**  
- Provisions VPC, subnets, security groups, Route 53 DNS records, and RDS instances.
- Sets up both primary and replica RDS instances across multiple regions.

### 2. **Jenkins**  
- Automates health checks on RDS replication and triggers failover actions when necessary.
- Integrates with AWS CLI to manage resources.
- Runs scheduled maintenance tasks using **AWS Systems Manager (SSM)**.

### 3. **Lambda**  
- Monitors RDS replication lag and automatically triggers failover.
- Updates **Route 53** DNS records to point to the new primary database during failover.

### 4. **CloudWatch**  
- Monitors replication health and database performance.
- Sends alerts for issues or replication lag via **SNS** topics.

### 5. **AWS Systems Manager (SSM)**  
- Runs maintenance tasks and scripts on RDS instances, such as backups or updates.

---

## **How It Works**  

1. **Terraform** provisions the infrastructure, including RDS instances, Route 53 DNS records, and VPC components.  
2. **Jenkins** automates health checks and initiates **Lambda**-based failover if the primary database becomes unavailable.  
3. **Lambda** updates Route 53 DNS records to ensure services point to the new primary database.  
4. **CloudWatch** monitors replication lag and health metrics, triggering alerts through SNS if issues arise.  
5. **SSM** handles database maintenance tasks like patching and backups.

---

## **Architecture Flow**  
1. **CloudWatch** detects replication lag or issues →  
2. **SNS** triggers a **Lambda** function →  
3. **Lambda** promotes the replica to primary and updates **Route 53** DNS records →  
4. **Jenkins** handles maintenance tasks via **SSM** and sends notifications for status updates.

---

## **Usage Instructions**  

### **1. Clone the Repository**
```bash
git clone https://github.com/vanshikaag13/multi-region-db-orchestrator.git
cd multi-region-db-orchestrator
```

### **2. Configure Terraform**
- Update variables in `variables.tf` for your AWS regions, instance types, and other configurations.
- Initialize Terraform:
  ```bash
  terraform init
  ```
- Apply the Terraform configuration:
  ```bash
  terraform apply -auto-approve
  ```

### **3. Set Up Jenkins Pipeline**
- Import the provided Jenkinsfile into your Jenkins instance.
- Configure AWS credentials and permissions within Jenkins.
- Schedule the Jenkins job to run health checks periodically.

### **4. Deploy Lambda Function**
- Zip the Lambda function code and upload it to AWS Lambda.
- Ensure Lambda has the appropriate IAM role to manage RDS and Route 53 resources.

### **5. Monitor CloudWatch Metrics**
- Verify that CloudWatch alarms are set up to monitor replication lag.
- Ensure SNS notifications are configured to trigger the Lambda function.

---

## **Tools & Technologies**  
- **Terraform**: Infrastructure as Code (IaC)  
- **Jenkins**: CI/CD and automation  
- **AWS Lambda**: Event-driven failover logic  
- **CloudWatch**: Monitoring and alerts  
- **Route 53**: DNS management for failover  
- **SSM**: Automated maintenance and tasks  

---

## **Contributing**  
Feel free to submit pull requests or report issues to improve this project. Contributions are welcome!

---

## **License**  
This project is licensed under the MIT License.

---

## **Contact**  
For questions or feedback, please contact [your-email@example.com].
