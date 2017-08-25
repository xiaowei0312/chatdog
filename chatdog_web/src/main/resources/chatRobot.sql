drop database if exists CHATROBOT;
create database if not exists CHATROBOT default character set utf8 collate utf8_general_ci;

use CHATROBOT;

create table t_operation(
	id int auto_increment,
	name varchar(33),
	url varchar(256),
	imgUrl varchar(33),	--	 菜单图标
	style varchar(33), -- 显示样式
	seqnum int, --  序号（用于显示排号）
	isMenu int,	--	是否作为左栏菜单显示
	parentId int,	--	父菜单ID
	primary key(id),
	foreign key(parentId) references t_operation(id)
);

create table t_permission(
	id int auto_increment,
	name varchar(33) not null,
	operationId int,
	primary key(id),
	foreign key(operationId) references t_operation(id)
);

create table t_role(
	id int auto_increment,
	roleName varchar(30),
	roleGrade int,
	seqNum int,
	primary key(id)
);

create table t_role_perm(
	id int auto_increment,
	roleId int,
	permId int,
	primary key(id),
	foreign key(roleId) references t_role(id),
	foreign key(permId) references t_permission(id)
);

drop table if exists t_user;
create table t_user(
	id int auto_increment,
	username varchar(32) unique, -- email or phone
	password varchar(128), 		-- password
	phone varchar(22),
	headImgUrl varchar(255),
	status int default 0,	--	0正常 1禁用
	extra varchar(255),		--	额外信息
	roleId int default 2,	-- 	角色
	primary key(id)
);

-- 分类表
drop table if exists t_qa_type;
create table if not exists t_qa_type(
	id varchar(37) primary key,
	name varchar(50) unique not null,
	sequence int,
	extra varchar(255)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 标志
drop table if exists t_qa_flag;
create table if not exists t_qa_flag(	-- 问答、图文
	id varchar(37) primary key,
	flagNo int unique not null,
	name varchar(50) unique not null,
	sequence int,
	extra varchar(255)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;	

-- 问答表
drop table if exists t_qa;
create table if not exists t_qa(
	id varchar(37) primary key,
	question varchar(255) unique not null,
	answer text,
	url varchar(255),
	picUrl varchar(255),
	flagId varchar(37),		-- 话题模式：问答、图文
	lastModifyTime timestamp,
	status int,	-- 0 normal, 1 disable, 2 deleted
	extra varchar(255),
	typeId varchar(37),
	foreign key(typeId) references t_qa_type(id),
	foreign key(flagId) references t_qa_flag(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into t_operation values(1,'系统概况','/user/systemOverview.action',null,'fa-home',1,1,null);
insert into t_operation values(2,'配置中心',null,null,'fa-cogs',2,1,null);
insert into t_operation values(3,'授权管理',null,null,'fa-book',3,1,null);
insert into t_operation values(4,'权限管理','/user/roleManagement.action',null,null,4,1,3);
insert into t_operation values(5,'角色管理','/user/roleManagement.action',null,null,5,1,3);
insert into t_operation values(6,'用户管理','/user/roleManagement.action',null,null,6,1,3);
insert into t_operation values(7,'话题管理',null,null,'fa-book',7,1,null);
insert into t_operation values(8,'话题分类管理','/qa/typeManagement.action',null,null,8,1,7);
insert into t_operation values(9,'话题管理','/qa/qaManagement.action',null,null,9,1,7);

insert into t_permission values(1,'系统概况',1);
insert into t_permission values(2,'配置中心',2);
insert into t_permission values(3,'授权管理',3);
insert into t_permission values(4,'权限管理',4);
insert into t_permission values(5,'角色管理',5);
insert into t_permission values(6,'用户管理',6);
insert into t_permission values(7,'话题管理',7);
insert into t_permission values(8,'话题分类管理',8);
insert into t_permission values(9,'话题管理',9);

insert into t_role values(1,'超级管理员',1,2);
insert into t_role values(2,'管理员',1,1);

insert into t_role_perm(roleId,permId) values(1,1);
insert into t_role_perm(roleId,permId) values(1,2);
insert into t_role_perm(roleId,permId) values(1,3);
insert into t_role_perm(roleId,permId) values(1,4);
insert into t_role_perm(roleId,permId) values(1,5);
insert into t_role_perm(roleId,permId) values(1,6);
insert into t_role_perm(roleId,permId) values(1,7);
insert into t_role_perm(roleId,permId) values(1,8);
insert into t_role_perm(roleId,permId) values(1,9);
insert into t_role_perm(roleId,permId) values(2,1);
insert into t_role_perm(roleId,permId) values(2,2);
insert into t_role_perm(roleId,permId) values(2,7);
insert into t_role_perm(roleId,permId) values(2,8);
insert into t_role_perm(roleId,permId) values(2,9);

insert into t_user values(1,'admin',password('admin'),'13546712419','',0,'',1);
insert into t_user values(2,'chenlijun',password('chenlijun'),'13703517045','',0,'',2);

insert into t_qa_type values(upper(replace(uuid(),'-','')),'分类1',1,'');
insert into t_qa_type values(upper(replace(uuid(),'-','')),'分类2',2,'');
insert into t_qa_type values(upper(replace(uuid(),'-','')),'分类3',3,'');
insert into t_qa_type values(upper(replace(uuid(),'-','')),'分类4',4,'');
insert into t_qa_type values(upper(replace(uuid(),'-','')),'分类5',5,'');

insert into t_qa_flag values(upper(replace(uuid(),'-','')),1,'问答消息',1,'');
insert into t_qa_flag values(upper(replace(uuid(),'-','')),2,'图文消息',2,'');

insert into t_qa values(upper(replace(uuid(),'-','')),'你的名字','LiLei','','','C571E92615C011E7B56A00FF6D9BB3B9',now(),0,'','68CF35950FDB11E7BA2500FF6D9BB3B9');
insert into t_qa values(upper(replace(uuid(),'-','')),'你的年龄','20','','','C571E92615C011E7B56A00FF6D9BB3B9',now(),0,'','68CF35950FDB11E7BA2500FF6D9BB3B9');
insert into t_qa values(upper(replace(uuid(),'-','')),'你的性别','男','','','C571E92615C011E7B56A00FF6D9BB3B9',now(),0,'','68CF35950FDB11E7BA2500FF6D9BB3B9');