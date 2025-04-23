class Object {
  class AttributeCategories {
    class RGVAR(attributes) {
      displayName = RCSTRING(editorAttributes);
      collapsed = 1;
      class Attributes {
        class RGVAR(startInstalled) {
          property = QRGVAR(startInstalled);
          displayName = RCSTRING(editorAttribute_startInstalled_displayName);
          tooltip = RCSTRING(editorAttribute_startInstalled_tooltip);
          expression = QUOTE(if (_value) then { SET_INSTALLED(_this,_value) });
          control = "Checkbox";
          typeName = "BOOL";
          defaultValue = "(false)";
        };

        class RGVAR(canInstall) {
          property = QRGVAR(canInstall);
          displayName = RCSTRING(editorAttribute_canInstall_displayName);
          tooltip = RCSTRING(editorAttribute_canInstall_tooltip);
          expression = QUOTE(if (!_value) then { SET_CAN_INSTALL(_this,_value) });
          control = "Checkbox";
          typeName = "BOOL";
          defaultValue = "(true)";
        };
      };
    };
  };
};
