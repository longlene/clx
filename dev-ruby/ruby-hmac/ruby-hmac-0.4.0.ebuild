# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="This module provides common interface to HMAC functionality. HMAC is a kind of \"Message Authentication Code\" (MAC) algorithm whose standard is documented in RFC2104. Namely, a MAC provides a way to check the integrity of information transmitted over or stored in an unreliable medium, based on a secret key.

Originally written by Daiki Ueno. Converted to a RubyGem by Geoffrey Grosenbach"
HOMEPAGE="http://ruby-hmac.rubyforge.org"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""


