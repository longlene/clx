# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Converts a vimwiki markdown file to html"
HOMEPAGE="https://github.com/patrickdavey/wimwiki_markdown"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.6"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"
ruby_add_rdepend ">=dev-ruby/pry-0.9.12"
ruby_add_rdepend ">=dev-ruby/rspec-its-1.1.0"
ruby_add_rdepend ">=dev-ruby/rspec-html-matchers-0.6.1"
ruby_add_rdepend ">=dev-ruby/guard-rspec-4.3"
ruby_add_rdepend ">=dev-ruby/activesupport-4.1.6"
ruby_add_rdepend ">=dev-ruby/github-markup-1.3.0"
ruby_add_rdepend ">=dev-ruby/github-markdown-0.6.8"
ruby_add_rdepend ">=dev-ruby/github-linguist-3.1.5"
ruby_add_rdepend ">=dev-ruby/redcarpet-3.1.2"
ruby_add_rdepend ">=dev-ruby/html-pipeline-1.11.0"

