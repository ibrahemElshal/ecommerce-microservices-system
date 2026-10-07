# E-Commerce Microservices System

A comprehensive e-commerce platform built with Spring Boot microservices architecture, featuring service discovery, API gateway, centralized configuration, message queuing, and authentication.

## Architecture Overview

This system follows a microservices architecture with the following components:

- **Service Discovery**: Netflix Eureka for service registration and discovery
- **API Gateway**: Spring Cloud Gateway for routing and security
- **Configuration Server**: Spring Cloud Config for centralized configuration management
- **Message Broker**: Apache Kafka for asynchronous event-driven communication
- **Authentication**: Keycloak for OAuth2/JWT authentication
- **Databases**: PostgreSQL (relational) and MongoDB (document)

## Services

| Service | Port | Description | Database |
|---------|------|-------------|----------|
| Config Server | 8888 | Centralized configuration management | - |
| Discovery Service (Eureka) | 8761 | Service registry | - |
| API Gateway | 8222 | API routing and security | - |
| Customer Service | 8090 | Customer management | MongoDB |
| Order Service | 8060 | Order processing | PostgreSQL |
| Product Service | 8050 | Product catalog | PostgreSQL |
| Payment Service | 8095 | Payment processing | PostgreSQL |
| Notification Service | 8070 | Email notifications | - |

## Technologies

- **Java 17**
- **Spring Boot 3.2.5**
- **Spring Cloud 2023.0.1**
- **Spring Cloud Gateway** (Reactive)
- **Spring Cloud Config**
- **Netflix Eureka**
- **Spring Kafka**
- **MongoDB**
- **PostgreSQL**
- **Apache Kafka**
- **Keycloak**
- **Maven**

## Prerequisites

- Java 17 or higher
- Maven 3.6+
- Docker and Docker Compose

## Infrastructure Setup

Start all infrastructure services using Docker Compose:

```bash
docker-compose up -d
```

This will start:
- PostgreSQL (port 5432)
- pgAdmin (port 5050)
- MongoDB (port 27017)
- Mongo Express (port 8081)
- MailDev (ports 1025, 8025)
- Zookeeper (port 22181)
- Kafka (port 9092)
- Keycloak (port 9098)

### Infrastructure Access

- **Mongo Express**: http://localhost:8081
- **pgAdmin**: http://localhost:5050
- **MailDev**: http://localhost:8025
- **Keycloak Admin Console**: http://localhost:9098/admin
  - Username: `admin`
  - Password: `admin`

## Application Setup

### 1. Start Config Server

```bash
cd Services/congif-server
./mvnw spring-boot:run
```

### 2. Start Discovery Service

```bash
cd Services/discovery
./mvnw spring-boot:run
```

### 3. Start Gateway

```bash
cd Services/gateway
./mvnw spring-boot:run
```

### 4. Start Business Services

Start each service in separate terminals:

```bash
# Customer Service
cd Services/customer
./mvnw spring-boot:run

# Product Service
cd Services/product
./mvnw spring-boot:run

# Order Service
cd Services/order
./mvnw spring-boot:run

# Payment Service
cd Services/payment
./mvnw spring-boot:run

# Notification Service
cd Services/notification
./mvnw spring-boot:run
```

## API Endpoints

All services are accessible through the API Gateway at `http://localhost:8222`

### Customer Service
- `GET /api/v1/customers` - Get all customers
- `POST /api/v1/customers` - Create customer
- `GET /api/v1/customers/{customer-id}` - Get customer by ID
- `PUT /api/v1/customers/{customer-id}` - Update customer
- `DELETE /api/v1/customers/{customer-id}` - Delete customer
- `GET /api/v1/customers/exist/{customer-id}` - Check if customer exists

### Order Service
- `GET /api/v1/orders` - Get all orders
- `POST /api/v1/orders` - Create order
- `GET /api/v1/orders/{order-id}` - Get order by ID

### Product Service
- `GET /api/v1/products` - Get all products
- `POST /api/v1/products` - Create product
- `GET /api/v1/products/{product-id}` - Get product by ID

### Payment Service
- `GET /api/v1/payments` - Get all payments
- `POST /api/v1/payments` - Create payment

## Configuration

Configuration is managed centrally by the Config Server. Service-specific configurations are located in:
- `Services/congif-server/src/main/resources/configurations/`

### Keycloak Configuration

The gateway is configured to use Keycloak for JWT authentication:
- Realm: `micro-services`
- Issuer URI: `http://localhost:9098/realms/micro-services`

## Database Credentials

### PostgreSQL
- Username: `Ebo`
- Password: `E1b2o3`
- Port: `5432`

### MongoDB
- Username: `Ebo`
- Password: `E1b2o3`
- Port: `27017`

## Service Discovery

View registered services at:
- Eureka Dashboard: http://localhost:8761

## Kafka Topics

The system uses Kafka for asynchronous communication between services:
- Order confirmation events
- Payment notifications
- Email notifications

## Troubleshooting

### Kafka Connection Issues
If Kafka fails to start, ensure you're using the correct version (7.5.0) as specified in docker-compose.yaml.

### Service Registration
If services fail to register with Eureka, ensure:
- Config Server is running first
- Discovery Service (Eureka) is running
- Services can reach localhost:8761

### MongoDB Connection
If services can't connect to MongoDB:
- Verify MongoDB container is running: `docker ps`
- Check credentials in service configuration files

## Development

### Building All Services
```bash
cd Services/[service-name]
./mvnw clean install
```

### Running Tests
```bash
cd Services/[service-name]
./mvnw test
```

## Project Structure

```
Ecommerce-system/
├── Services/
│   ├── congif-server/      # Configuration server
│   ├── discovery/          # Eureka service registry
│   ├── gateway/            # API Gateway with security
│   ├── customer/           # Customer service
│   ├── order/              # Order service
│   ├── product/            # Product service
│   ├── payment/            # Payment service
│   └── notification/       # Notification service
├── docker-compose.yaml     # Infrastructure services
├── postman/                # API collections
├── Diagrams/               # Architecture diagrams
└── Resources/              # Additional resources
```

## Security

The API Gateway implements OAuth2 Resource Server security with JWT tokens issued by Keycloak. All routes except `/eureka/**` require authentication.

## License

This project is for educational purposes.
