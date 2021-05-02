# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="TwitterAuth is a Rails plugin gem that provides Single Sign-On capabilities for Rails applications via Twitter"
HOMEPAGE="http://github.com/mbleigh/twitter-auth"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/oauth-0.3.1"
ruby_add_rdepend ">=dev-ruby/ezcrypto-0.7.2"

