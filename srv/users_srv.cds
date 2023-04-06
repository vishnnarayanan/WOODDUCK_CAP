using woodduck.entities from './entities';

service MyService {


  entity Users                       as projection on entities.Users;
  entity User_PermissionSet_XR       as projection on entities.User_PermissionSet_XR;
  entity Permissions                 as projection on entities.Permissions;
  entity PermissionSets              as projection on entities.PermissionSets;
  entity Permission_PermissionSet_XR as projection on entities.Permission_PermissionSet_XR;
}
