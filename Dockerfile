# 개발용 이미지 설정
FROM node:latest AS build

# 작업 디렉토리 설정
WORKDIR /frontapp

# 소스 코드 복사
COPY . .

# 필요한 라이브러리 및 의존성 설치
RUN npm install

# Vite 설치
RUN npm install -g vite

# 프로덕션 빌드
RUN npm run build

# 프로덕션 이미지 설정
FROM node:alpine AS production

# 작업 디렉토리 설정
WORKDIR /frontapp

# 프로덕션 이미지로부터 빌드된 파일 복사
COPY --from=build /frontapp /frontapp

# 실행할 명령어 설정
CMD [ "npm", "run", "dev"]