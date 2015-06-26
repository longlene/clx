# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=""
HOMEPAGE="http://octopress.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/mercenary-0.3.2"
ruby_add_rdepend ">=dev-ruby/jekyll-2.0"
ruby_add_rdepend ">=dev-ruby/titlecase-0"
ruby_add_rdepend ">=dev-ruby/octopress-deploy-0"
ruby_add_rdepend ">=dev-ruby/octopress-hooks-2.0"
ruby_add_rdepend ">=dev-ruby/octopress-escape-code-2.0"
ruby_add_rdepend ">=dev-ruby/redcarpet-3.0"
ruby_add_rdepend ">=dev-ruby/octopress-ink-0"
ruby_add_rdepend ">=dev-ruby/bundler-1.3"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/clash-0"
ruby_add_rdepend ">=dev-ruby/pry-byebug-0"

