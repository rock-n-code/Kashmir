//
//  DataStackValidation.swift
//  Kashmir
//
//  Created by Javier Cicchelli on 04/01/2017.
//  Copyright © 2017 Rock & Code. All rights reserved.
//

extension DataStack {
    
    /**
    Representation of the possible validation checks to perform while using a `DataStack` instance.
     
    * **modelNameIsNotEmpty**: Check if a given model name is not an empty string.
    * **containerExists**: Check if a container associated with a given model does exist in the containers' dictionary.
    * **containerNotExists**: Check if a container associated with a given model does not exist in the containers' dictionary.
    */
    enum Validation {
        /// Check if a given model name is not an empty string.
        case modelNameIsNotEmpty
        /// Check if a container associated with a given model does exist in the containers' dictionary.
        case containerExists
        /// Check if a container associated with a given model does not exist in the containers' dictionary.
        case containerNotExists
    }
    
}
