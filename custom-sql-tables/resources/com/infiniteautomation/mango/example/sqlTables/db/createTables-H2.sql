--
--    Copyright (C) 2021 Radix IoT All rights reserved.
--    @author Terry Packer
--
CREATE TABLE exampleSites
(
    id         INT          NOT NULL AUTO_INCREMENT,
    xid        VARCHAR(100) NOT NULL,
    name       VARCHAR(255) NOT NULL,
    readPermissionId   INT          NOT NULL,
    editPermissionId   INT          NOT NULL,
    data       CLOB,
    PRIMARY KEY (id)
);
ALTER TABLE exampleSites
    ADD CONSTRAINT exampleSitesUnq1 UNIQUE (xid);
ALTER TABLE exampleSites
    ADD CONSTRAINT exampleSitesFk1 FOREIGN KEY (readPermissionId) REFERENCES permissions (id) ON DELETE RESTRICT;
ALTER TABLE exampleSites
    ADD CONSTRAINT exampleSitesFk2 FOREIGN KEY (editPermissionId) REFERENCES permissions (id) ON DELETE RESTRICT;


CREATE TABLE exampleAssets
(
    id                     INT          NOT NULL AUTO_INCREMENT,
    xid                    VARCHAR(100) NOT NULL,
    name                   VARCHAR(255) NOT NULL,
    readPermissionId       INT          NOT NULL,
    editPermissionId       INT          NOT NULL,
    siteId                 INT          NOT NULL,
    data                   CLOB,
    PRIMARY KEY (id)
);
ALTER TABLE exampleAssets
    ADD CONSTRAINT exampleAssetsUnq1 UNIQUE (xid);
ALTER TABLE exampleAssets
    ADD CONSTRAINT exampleAssetsFk1 FOREIGN KEY (readPermissionId) REFERENCES permissions (id) ON DELETE RESTRICT;
ALTER TABLE exampleAssets
    ADD CONSTRAINT exampleAssetsFk2 FOREIGN KEY (editPermissionId) REFERENCES permissions (id) ON DELETE RESTRICT;
ALTER TABLE exampleAssets
    ADD CONSTRAINT exampleAssetsFk3 FOREIGN KEY (siteId) REFERENCES exampleSites (id) ON DELETE CASCADE;