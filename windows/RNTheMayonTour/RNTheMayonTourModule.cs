using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace The.Mayon.Tour.RNTheMayonTour
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNTheMayonTourModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNTheMayonTourModule"/>.
        /// </summary>
        internal RNTheMayonTourModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNTheMayonTour";
            }
        }
    }
}
