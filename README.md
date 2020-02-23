# AWS Infra as code CI/CD (with Terraform)



## 가정 사항

- Infrastructure as code에 대한 기본적인 지식을 가지고 있음
- AWS에 대한 기초적인 지식을 가지고 있음
- 리전 : Seoul (ap-northeast-2)
- 환경 : macOS Catalina Version 10.15.3



## 생성되는 인프라

- 이 [예제](https://github.com/toule/aws_cdk_basic_sample)와 인프라는 비슷함
- VPC (Virtual Private Cloud)
- Subnet
- NAT Gateway
- EC2 (with System Manager)
- ALB (Application Load Balancer)
- Code Series (CodeCommit, CodeBuild, CodeDeploy, CodePipeline)

![arch](./images/arch.png)



## CI/CD Pipeline 구성

- 이 [예제](https://github.com/toule/cicd-sample-demo)를 활용 (CodePipeline, CodeCommit, CodeBuild, CodeDeploy)

- 참고

  - 일반적으로 소스와 인프라의 CI/CD Pipeline은 분리 시켜야함
  - 현 예제는 CodeDeploy까지 활용한 예시를 보여줌

- 추가 사항

  - CodeBuild에서 Access key와 Secret key를 파라미터 형태로 집어넣어야 함
  - **중요:** 이런 중요한 variable의 경우 System Manager의 Parameter Store 혹은 Secrets Manager를 사용하는 것을 권장함 (현 예제는 용이성은 위해 Plain Text로 사용하였음)

  ![arch](./images/variable.png)



- 실행

  - git repository 설정 (생성한 코드 커밋 주소 확인)

  ```bash
  git remote add origin <my-codecommit-repo>
  ```
  
  - commit
  
  ```bash
  git add .
  git  commit -m "inital commit"
  git push origin master
  ```
  
   