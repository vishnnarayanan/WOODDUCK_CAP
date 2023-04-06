namespace woodduck.entities;

using {managed} from '@sap/cds/common';

entity Users : managed {
  key id                     : Integer;
      userId                 : String;
      email                  : String;
      division               : String;
      subDivision            : String;
      isActive               : String;
      user_PermissionSet_XRs : Composition of many User_PermissionSet_XR
                                 on user_PermissionSet_XRs.user = $self;
}

entity User_PermissionSet_XR : managed {

  key id            : Integer;
      comment       : String;
      beginDate     : DateTime;
      endDate       : DateTime;
  key user          : Association to Users;
  key permissionSet : Association to PermissionSets;
      isTemporary   : Boolean;

}

entity PermissionSets : managed {

  key id                          : Integer;
      permissionSetName           : String;
      permissionSetDescription    : String;
      user_PermissionSet_XRs      : Composition of many User_PermissionSet_XR
                                      on user_PermissionSet_XRs.permissionSet = $self;
      permission_PermissionSet_XR : Composition of Permission_PermissionSet_XR
                                      on permission_PermissionSet_XR.permissionSet = $self;

}

entity Permissions : managed {

  key id                          : Integer;
      permissionName              : String;
      permissionSetDescription    : String;
      permission_PermissionSet_XR : Composition of Permission_PermissionSet_XR
                                      on permission_PermissionSet_XR.permission = $self;
}

entity Permission_PermissionSet_XR {

  key permission    : Association to Permissions;
  key permissionSet : Association to PermissionSets;
}
