# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A Ruby kernel for Jupyter/IPython frontends (e"
HOMEPAGE="https://github.com/SciRuby/iruby"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rake-10.4"
ruby_add_rdepend ">=dev-ruby/bond-0.5"
ruby_add_rdepend ">=dev-ruby/multi_json-1.11"
ruby_add_rdepend ">=dev-ruby/mimemagic-0.3"
ruby_add_rdepend ">=dev-ruby/data_uri-0.1"

