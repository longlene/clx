# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Meta gem depending on all official Mustermann gems"
HOMEPAGE="https://github.com/rkh/mustermann"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend "=dev-ruby/mustermann-0.4.0"
ruby_add_rdepend "=dev-ruby/mustermann-cake-0.4.0"
ruby_add_rdepend "=dev-ruby/mustermann-express-0.4.0"
ruby_add_rdepend "=dev-ruby/mustermann-fileutils-0.4.0"
ruby_add_rdepend "=dev-ruby/mustermann-flask-0.4.0"
ruby_add_rdepend "=dev-ruby/mustermann-pyramid-0.4.0"
ruby_add_rdepend "=dev-ruby/mustermann-rails-0.4.0"
ruby_add_rdepend "=dev-ruby/mustermann-shell-0.4.0"
ruby_add_rdepend "=dev-ruby/mustermann-simple-0.4.0"
ruby_add_rdepend "=dev-ruby/mustermann-strscan-0.4.0"
ruby_add_rdepend "=dev-ruby/mustermann-uri-template-0.4.0"
ruby_add_rdepend "=dev-ruby/mustermann-visualizer-0.4.0"

