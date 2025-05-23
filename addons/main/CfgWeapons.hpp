class CBA_MiscItem;
class CBA_MiscItem_ItemInfo;

class CLASS_JUKEBOX_ITEM: CBA_MiscItem {
  displayName = RCSTRING(displayName);
  descriptionShort = RCSTRING(descriptionShort);
  author = "ScottyThePilot";
  model = "\A3\Structures_F\Items\Electronics\FMradio_F.p3d";
  picture = QPATHTO(data\ui\icon_jukebox_ca.paa);

  ACE_attachable = QCLASS_JUKEBOX_OBJECT;
  ACE_isTool = 1;

  class ItemInfo: CBA_MiscItem_ItemInfo {
    mass = 2;
  };

  scope = 2;
};
