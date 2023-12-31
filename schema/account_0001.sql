BEGIN;
--
-- Create model MyUser
--
CREATE TABLE "accounts_myuser" ("password" varchar(128) NOT NULL, "last_login" timestamp with time zone NULL, "is_superuser" boolean NOT NULL, "username" varchar(150) NOT NULL UNIQUE, "first_name" varchar(150) NOT NULL, "last_name" varchar(150) NOT NULL, "email" varchar(254) NOT NULL, "is_staff" boolean NOT NULL, "is_active" boolean NOT NULL, "date_joined" timestamp with time zone NOT NULL, "pkid" bigint NOT NULL PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY, "id" uuid NOT NULL UNIQUE, "dob" date NULL, "phone" varchar(128) NOT NULL);
CREATE TABLE "accounts_myuser_groups" ("id" bigint NOT NULL PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY, "myuser_id" bigint NOT NULL, "group_id" integer NOT NULL);
CREATE TABLE "accounts_myuser_user_permissions" ("id" bigint NOT NULL PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY, "myuser_id" bigint NOT NULL, "permission_id" integer NOT NULL);
CREATE INDEX "accounts_myuser_username_d9cb398a_like" ON "accounts_myuser" ("username" varchar_pattern_ops);
ALTER TABLE "accounts_myuser_groups" ADD CONSTRAINT "accounts_myuser_groups_myuser_id_group_id_6e1e817b_uniq" UNIQUE ("myuser_id", "group_id");
ALTER TABLE "accounts_myuser_groups" ADD CONSTRAINT "accounts_myuser_grou_myuser_id_8dba2d0e_fk_accounts_" FOREIGN KEY ("myuser_id") REFERENCES "accounts_myuser" ("pkid") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "accounts_myuser_groups" ADD CONSTRAINT "accounts_myuser_groups_group_id_25089153_fk_auth_group_id" FOREIGN KEY ("group_id") REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "accounts_myuser_groups_myuser_id_8dba2d0e" ON "accounts_myuser_groups" ("myuser_id");
CREATE INDEX "accounts_myuser_groups_group_id_25089153" ON "accounts_myuser_groups" ("group_id");
ALTER TABLE "accounts_myuser_user_permissions" ADD CONSTRAINT "accounts_myuser_user_per_myuser_id_permission_id_d0c28f68_uniq" UNIQUE ("myuser_id", "permission_id");
ALTER TABLE "accounts_myuser_user_permissions" ADD CONSTRAINT "accounts_myuser_user_myuser_id_e664c60a_fk_accounts_" FOREIGN KEY ("myuser_id") REFERENCES "accounts_myuser" ("pkid") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "accounts_myuser_user_permissions" ADD CONSTRAINT "accounts_myuser_user_permission_id_27a5b249_fk_auth_perm" FOREIGN KEY ("permission_id") REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "accounts_myuser_user_permissions_myuser_id_e664c60a" ON "accounts_myuser_user_permissions" ("myuser_id");
CREATE INDEX "accounts_myuser_user_permissions_permission_id_27a5b249" ON "accounts_myuser_user_permissions" ("permission_id");
COMMIT;
