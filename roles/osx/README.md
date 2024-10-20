# Role

```plaintext
.
├── files : 수정하지 않을 파일들
├── templates : jinja2 템플릿 파일들
├── handlers: 핸들러들
├── tasks: 해야 할일들
├── defaults : 재정의할 수 있는 기본 변수
├── vars: 재정의할 수 없는 변수
└── meta: 롤에 대한 의존 정보
```

필요하지 않은 directory 는 제거해도 되지만, 제거하지 않은 directory는 반드시 `main.yml` 파일이 있어야 합니다.
