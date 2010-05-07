package org.esupportail.twitter.xstream;

import org.springframework.oxm.xstream.XStreamMarshaller;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.mapper.CannotResolveClassException;
import com.thoughtworks.xstream.mapper.MapperWrapper;

/**
 * Made XStream tolerant to XML elements which are not mapped
 * 
 * @see http://jira.codehaus.org/browse/XSTR-30
 */
public class EsupXStreamMarshaller extends XStreamMarshaller {

	private final XStream xstream = new XStream() {
		@Override
		protected MapperWrapper wrapMapper(MapperWrapper next) {
			return new MapperWrapper(next) {
				@Override
				public boolean shouldSerializeMember(Class definedIn,
						String fieldName) {
					try {
						return definedIn != Object.class
								|| realClass(fieldName) != null;
					} catch (CannotResolveClassException cnrce) {
						return false;
					}
				}
			};
		}
	};

	@Override
	public XStream getXStream() {
		return this.xstream;
	}

}
