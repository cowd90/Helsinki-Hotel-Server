FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

#
# Package stage
#
FROM maven:3.8.3-openjdk-17
COPY --from=build /target/HotelProject-0.0.1-SNAPSHOT.jar HotelProject.jar
EXPOSE 9192
ENTRYPOINT ["java","-jar","demo.jar"]