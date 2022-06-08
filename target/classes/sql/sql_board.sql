drop table board_tbl;

create table board_tbl (
	bno int auto_increment primary key,
    title varchar(300) not null,
    content text not null,
    writer varchar(50) not null,
    regDate timestamp default current_timestamp not null,
    updateDate timestamp default current_timestamp not null
);

insert into board_tbl (title, content, writer)
values ('제목','내용','작가');
insert into board_tbl (title, content, writer)
values ('제목2','내용2','작가2');
